import { api, LightningElement } from 'lwc';

export default class TimePicker extends LightningElement {

    id = "time"

    getTimeInput() {
        return this.template.querySelector(`lightning-input[data-id=${this.id}]`)
    }
    
    @api 
    get value() {
        return this.getTimeInput().value
    }

    @api
    checkValidity() {
        return this.getTimeInput().checkValidity()
    }
}