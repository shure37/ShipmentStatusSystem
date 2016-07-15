package acount;
import database.DBConnection;

public class User {
    public String username;
    public String password;
    public User user;
    
    public User(){
    }
    public User(String username,String password){
    	this.username = username;
  	    this.password = password;
    }
   
    public void login(String username,String password) throws Exception{
    	  this.username = username;
    	  this.password = password;
    	  
    	  String sql = "select authority from account WHERE username= '"+username+"' and password='"+password+"'"; 
          String res[][] = new DBConnection().executeQuery(sql);	
          
          if(res==null || res.length == 0)throw new Exception("Username or password error.");
          
          if(res[0][0].equals("1")) user = new Admin(username,password);
          else user = new Courier(username,password);
          
    }
}
