package shipment;
import database.DBConnection;

public class BuildRoute {
	
	public BuildRoute(){
	    
	}
	
	public ShipmentDetail[] getPackageRoute(int packageID)throws  Exception{
		
   	   String sql = "select LOCATIONA,LOCATIONB,USERNAME,ROUTENUMBER,DISTANCE from ROUTE WHERE ID= "+packageID+" order by ROUTENUMBER";
       String res[][] = new DBConnection().executeQuery(sql);	 
       
       if(res.length == 0)return new ShipmentDetail[0];
       ShipmentDetail[] ships = new ShipmentDetail[res.length];
       
       for(int i=0;i<ships.length;i++){
    	   ships[i] = new ShipmentDetail(
    			   Integer.parseInt(res[i][0]),
    			   Integer.parseInt(res[i][1]),
    			   res[i][2],
    			   Integer.parseInt(res[i][3]),
    			   Float.parseFloat(res[i][4])
    			   );
       }
       return ships;
	}
	
}
