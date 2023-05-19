import { LightningElement, track } from 'lwc';
import getDirectionsData from '@salesforce/apex/DirectionsController.getDirectionsData';

export default class DirectionsApp extends LightningElement {
  @track origin;
  @track destination;
  @track distance;
  @track travelTime;
  @track costOfTravel;
  @track showResults = false;

  handleOriginChange(event) {
    this.origin = event.target.value;
  }

  handleDestinationChange(event) {
    this.destination = event.target.value;
  }

  getDirections() {
    getDirectionsData({ origin: this.origin, destination: this.destination })
      .then(result => {
        this.distance = result.distance;
        this.travelTime = result.travelTime;
        this.costOfTravel = result.costOfTravel;
        this.showResults = true;
      })
      .catch(error => {
        console.error(error);
      });
  }
}
