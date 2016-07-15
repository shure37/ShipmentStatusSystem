package shipment;
import database.DBConnection;

public class Package {
     public int ID;
     public float remainTime;
     public String startPoint;
     public ShipmentDetail[] route;
     public String address;
     public int location;
     public String shipmethod;
     public float speed;
   
     public Package(){
     }
    
     public void search(int ID)throws Exception{
    	 this.ID = ID;
    	 String sql = "select STARTPOINT,ADDRES,LOCATION,DESCRIPTION,SPEED from PACKAGE A,SHIP B WHERE A.ID= "
                     +ID+ " AND A.SHIPMETHOD=B.ID";
         String res[][] = new DBConnection().executeQuery(sql);
         if(res.length==0)throw new Exception("Package "+ID+" not exists.");
         startPoint = res[0][0];
         address = res[0][1];
         if(res[0][2]!= null)
            location = Integer.parseInt(res[0][2]);
         else
        	 location=0;
         shipmethod = res[0][3];
         
      
         speed = Float.parseFloat(res[0][4]);
         route = new BuildRoute().getPackageRoute(ID);
         calculateTime();
     }
    
     public float calculateTime(){
    	 if(location == 0 ){
    		 remainTime=-1;
    	 }else{
    	     remainTime =0;
             for(int i=location-1;i<route.length;i++) remainTime+=route[i].calculateTime(speed);
    	 }
         return remainTime;
     }
     
     public void modifyDetail(String addres)throws Exception{
     }
     
}
