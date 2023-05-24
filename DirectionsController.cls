public with sharing class DirectionsController {
  public class DirectionsResult {
    @AuraEnabled public Decimal distance { get; set; }
    @AuraEnabled public Decimal travelTime { get; set; }
    @AuraEnabled public Decimal costOfTravel { get; set; }
  }

  @AuraEnabled(cacheable=true)
  public static DirectionsResult getDirections(String originAddress, String destinationAddress) {
    DirectionsResult result = new DirectionsResult();
    result.distance = calculateDistance(originAddress, destinationAddress);
    result.travelTime = calculateTravelTime(originAddress, destinationAddress);
    result.costOfTravel = calculateCostOfTravel(result.distance);

    return result;
  }

  private static Decimal calculateDistance(String originAddress, String destinationAddress) {
    // Implement Google Maps API call to calculate distance
    // Return the calculated distance
  }

  private static Decimal calculateTravelTime(String originAddress, String destinationAddress) {
    // Implement Google Maps API call to calculate travel time
    // Return the calculated travel time
  }

  private static Decimal calculateCostOfTravel(Decimal distance) {
    // Implement Custom Metadata Type retrieval for rates per mile based on transportation mode
    // Calculate the cost of travel based on the distance and rates
    // Return the calculated cost of travel
  }

  public static String vHash = 'Sm9obiBEb2U='; // Your full name in Base64 encoding
}
``
