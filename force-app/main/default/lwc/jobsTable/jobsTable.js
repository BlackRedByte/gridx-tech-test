import { LightningElement, wire } from 'lwc';
import getJobs from '@salesforce/apex/GridXInterviewLauncherController.getJobs'

export default class JobsTable extends LightningElement {

    jobs = []
    updateInterval = 5000

    connectedCallback() {
        this.updateJobs();
        setInterval(() => {
            this.updateJobs()
        }, this.updateInterval);
    }

    updateJobs() {
        getJobs()
            .then(result => {
                this.jobs = result
            })
            .catch(error => {
                console.log(error)
            })
    }
}