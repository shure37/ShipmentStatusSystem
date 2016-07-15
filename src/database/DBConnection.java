package database;
import java.sql.*;
import java.util.*;

public class DBConnection {
     String url="jdbc:mysql://localhost/sdss?user=root&password=s19940121";
     String driverName="com.mysql.jdbc.Driver";
     String user="root";
     String passwd="s19940121";
     
     public DBConnection(){}
    
     public  String[][] executeQuery(String sql)throws Exception{
    	 Connection conn= null;
    	 Statement stat=null;
    	 ResultSet res= null;
    	 try{
    	   conn = DbConnect();
    	   stat = conn.createStatement();
    	   res=stat.executeQuery(sql);
    	   ResultSetMetaData metaData = res.getMetaData();
    	   int column_count = metaData.getColumnCount();
    	   Vector<Vector<String>> v = new Vector<Vector<String>>();
    	  
    	   while(res.next()){
    		   Vector<String> v1 = new Vector<String>();
    		   for(int i=0;i<column_count;i++){
    			   v1.addElement(res.getString(i+1));
    		   }
    		   v.addElement(v1);
               
    	   }
    	   if(v.size()==0)return new String[0][0];
    	   
    	   String strs[][] = new String[v.size()][column_count];
    	   for(int i=0;i<v.size();i++){
    		   Vector<String> v1 = (Vector<String>)v.elementAt(i);
    	      for(int j=0;j<v1.size();j++){
    	    	   strs[i][j] = v1.elementAt(j);
    	      }
    	   }
    	   return strs;
    	 }finally{
    	   if(res != null )res.close();
    	   if(stat != null )stat.close();
    	   if(conn != null)conn.close();
    	 }

     }
     public  void executeUpdate(String sql)throws Exception{
    	 Connection conn= null;
    	 Statement stat=null;
    	
    	 try{
    	   conn = DbConnect();
    	   stat = conn.createStatement();
    	   stat.executeUpdate(sql);
    	 }finally{
    	   if(stat != null )stat.close();
    	   if(conn != null)conn.close();
    	 }   	 
    	  
     }
     public   Connection DbConnect()throws Exception{
    	
    	  Class.forName(driverName);
          Connection connection = DriverManager.getConnection(url, user, passwd);
          return connection;
     }
     
    
}
