@IsTest
private class DirectionsControllerTest {
  @IsTest
  static void testGetDirections() {
    // Create test data
    DirectionsController.DirectionsResult expectedResult = new DirectionsController.DirectionsResult();
    expectedResult.distance = 10.5;
    expectedResult.travelTime = 2.5;
    expectedResult.costOfTravel = 25.0;
    
    // Mock HTTP callout response
    Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
    
    // Call the method under test
    DirectionsController.DirectionsResult actualResult = DirectionsController.getDirections('Origin', 'Destination');
    
    // Verify the results
    System.assertEquals(expectedResult.distance, actualResult.distance);
    System.assertEquals(expectedResult.travelTime, actualResult.travelTime);
    System.assertEquals(expectedResult.costOfTravel, actualResult.costOfTravel);
  }
  
  // Mock HTTP response generator
  private class MockHttpResponseGenerator implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest request) {
      // Create a mock HTTP response with sample data
      HttpResponse response = new HttpResponse();
      response.setHeader('Content-Type', 'application/json');
      response.setBody('{"status": "OK", "distance": 10.5, "travelTime": 2.5}');
      response.setStatusCode(200);
      
      return response;
    }
  }
}
