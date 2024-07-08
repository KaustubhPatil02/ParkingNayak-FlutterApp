class ParkingTicket {
  final String id;
  final String numberPlate;
  final int phoneNo;
  final int fine;
  final DateTime dateTime;
  
  final String dropLocation;  

  ParkingTicket({
    this.id = "",
    required this.numberPlate,
    
    required this.phoneNo,
    required this.dateTime,
    required this.dropLocation,
    required this.fine,    
  });
}
