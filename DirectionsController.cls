public with sharing class DirectionsController {
  // Define the Custom Metadata Type to store the rates per mile
  public class TransportationRate extends CustomMetadata {
    @AuraEnabled public String Mode__c;  // flying, driving, etc.
    @AuraEnabled public Decimal RatePerMile__c;
  }

  // Apex method to calculate the distance, travel time, and cost of travel
  @AuraEnabled(cacheable=true)
  public static Map<String, Object> getDirectionsData(String origin, String destination) {
    // Perform necessary API calls to Google Maps API for distance, travel time, and autocomplete
    // ...

    // Calculate the cost of travel based on the rates stored in the Custom Metadata Type
    TransportationRate rate = [SELECT RatePerMile__c FROM TransportationRate WHERE Mode__c = 'driving'];
    Decimal costOfTravel = rate.RatePerMile__c * distanceInMiles;

    //
