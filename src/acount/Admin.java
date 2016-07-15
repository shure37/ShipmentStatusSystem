package acount;

import database.DBConnection;

public class Admin extends User{
	 public Admin(String username,String password){
    	super( username, password);
     }
     public void createAcc(String username,String password)throws Exception{
    	 String sql = "Insert into account(username,password,authority) values('"+username+"','"+password+"',2)";
    	 new DBConnection().executeUpdate(sql);	
     }
     public void updateAcc(String username,String password)throws Exception{
    	 String sql = "update account set password='"+password+"' where username='"+username+"'";
    	 new DBConnection().executeUpdate(sql);	
     }
     public User[] showAllAcc()throws Exception{
    	 String sql = "Select * from account order by username";
    	 String res[][] = new DBConnection().executeQuery(sql);	
    	 User users[] = new User[res.length];
    	 for(int i=0;i<users.length;i++){
    	    users[i] = new User(res[i][0],res[i][1]);
    	 }
    	 return users;
     }
}
