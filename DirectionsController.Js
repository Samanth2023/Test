<script>
import { LightningElement, track, api } from 'lwc';
import getDirections from '@salesforce/apex/DirectionsController.getDirections';

export default class GetDirectionsComponent extends LightningElement {
  @track originAddress;
  @track destinationAddress;
  @track showResults = false;
  @track distance;
  @track travelTime;
  @track costOfTravel;

  handleOriginChange(event) {
    this.originAddress = event.target.value;
  }

  handleDestinationChange(event) {
    this.destinationAddress = event.target.value;
  }

  getDirections() {
    getDirections({
      originAddress: this.originAddress,
      destinationAddress: this.destinationAddress
    })
      .then(result => {
        this.showResults = true;
        this.distance = result.distance;
        this.travelTime = result.travelTime;
        this.costOfTravel = result.costOfTravel;
      })
      .catch(error => {
        // Handle error
      });
  }
}
</script>
