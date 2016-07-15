package acount;

import shipment.BuildRoute;
import database.DBConnection;


public class Courier extends User{
	public Courier(String username,String password){
    	super( username, password);
    }
	//创建后location为0，些时未起运，等待用户updateP
	public int createP(String startPoint,String route,int shipMethod)throws Exception{
		String routes[] = route.split("\\,");
		DBConnection db = new DBConnection();
		
		String sql = "select PACKAGESEQ.nextval from dual";
		String res[][] = db.executeQuery(sql);
		
		String ID = res[0][0];
		
		sql = "insert into package(ID,STARTPOINT,SHIPMETHOD,LOCATION) values("+ID+",'"+startPoint+"',"+shipMethod+",0)";
		db.executeUpdate(sql);
		
		for(int i=0;i<routes.length-1;i++){
		   sql = "insert into route(ID,LOCATIONA,LOCATIONB,ROUTENUMBER) values("+ID+","+routes[i]+","+routes[i+1]+","+(i+1)+")";
		   db.executeUpdate(sql);
		}

	    sql = "update route a set a.distance=(select b.distance from routedefault b where a.LOCATIONA=b.LOCATIONA and a.LOCATIONB=b.LOCATIONB )"
				+" where a.ID="+ID+" and exists ( select b.distance from routedefault b where a.LOCATIONA=b.LOCATIONA and a.LOCATIONB=b.LOCATIONB )";
	    db.executeUpdate(sql);
	    
	    return Integer.parseInt(ID);
    }
	//location 自动加1,并将该location的route username置为该用户
	public void updateP(int ID,String addres)throws Exception{
		DBConnection db = new DBConnection();
		String sql = "select max(routenumber) from  route where id="+ID;
		String res[][] = db.executeQuery(sql);
		int maxlocation= Integer.parseInt(res[0][0]);
	    sql = "select location from  package where id="+ID;
	    res=db.executeQuery(sql);
		int location=Integer.parseInt(res[0][0])+1;
		
		if(location <= maxlocation){
	      sql = "update package set addres='"+addres+"',location="+location+" where id="+ID;
		  db.executeUpdate(sql);
		
		  sql = "update route set username='"+username+"' where id="+ID+" and routenumber="+location;
		  db.executeUpdate(sql);
		}else if(location != 100){
	//结束后置location为99		
		  sql = "update package set addres='"+addres+"',location= 99 where id="+ID;
		  db.executeUpdate(sql);
		}
		
    }
	public shipment.Package[] showAllP()throws Exception{
	
   	    String sql = "select STARTPOINT,ADDRES,LOCATION,DESCRIPTION,SPEED,A.ID from PACKAGE A,SHIP B  "
                    +" where A.SHIPMETHOD=B.ID order by A.ID";
        String res[][] = new DBConnection().executeQuery(sql);
        shipment.Package[] packages = new shipment.Package[res.length];
        for(int i=0;i<packages.length;i++){
        	packages[i] = new shipment.Package();
        	packages[i].startPoint = res[i][0];
        	packages[i].address = res[i][1];
           if(res[i][2]!= null)
        	   packages[i].location = Integer.parseInt(res[i][2]);
           else
        	   packages[i].location=0;
           packages[i].shipmethod = res[i][3];
        
           packages[i].speed = Float.parseFloat(res[i][4]);
           packages[i].ID = Integer.parseInt(res[i][5]);
           packages[i].route = new BuildRoute().getPackageRoute(packages[i].ID);
           packages[i].calculateTime();
        }
        return packages;
    }
}
