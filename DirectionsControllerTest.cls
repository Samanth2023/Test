@isTest
private class DirectionsControllerTest {
  @isTest
  static void testGetDirectionsData() {
    // Create test data
    DirectionsController.TransportationRate rate = new DirectionsController.TransportationRate();
    rate.Mode__c = 'driving';
    rate.RatePerMile__c = 0.5; // Set a test rate per mile
    insert rate;

    // Create a mock response for the Google Maps API
    HttpMock mock = new HttpMock();
    mock.setStaticResource('GoogleMapsApiResponse', 'Sample API response from Google Maps API');

    // Set the mock response for the HTTP callout
    Test.setMock(HttpCalloutMock.class, mock);

    // Call the method under test
    Map<String, Object> result = DirectionsController.getDirectionsData('Origin', 'Destination');

    // Verify the result
    System.assertEquals('Expected Distance', result.get('distance'));
    System.assertEquals('Expected Travel Time', result.get('travelTime'));
    System.assertEquals(100.0, (Decimal)result.get('costOfTravel')); // Adjust with expected cost

    // Verify the SOQL query
    DirectionsController.TransportationRate queriedRate = [SELECT RatePerMile__c FROM DirectionsController.TransportationRate WHERE Mode__c = 'driving'];
    System.assertEquals(0.5, queriedRate.RatePerMile__c);
  }
}
