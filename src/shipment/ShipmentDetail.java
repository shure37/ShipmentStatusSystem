package shipment;

public class ShipmentDetail {
	 public int id;

	 public int location;
	 public int destation;
	 public float distance;
     public String username;
     
     public ShipmentDetail(int location,int destation,String username,int id,float distance){
         this.location = location;
         this.destation = destation;
         this.username = username;
         this.id = id;
         this.distance = distance;
     }
     
 
     public float calculateTime(float velocity){
         return distance/velocity;
     }
     
}
