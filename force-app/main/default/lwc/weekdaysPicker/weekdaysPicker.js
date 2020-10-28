import { LightningElement, api } from 'lwc';

export default class WeekdaysPicker extends LightningElement {
    
    id = "weekdays"

    getCheckboxGroup() {
        return this.template.querySelector(`lightning-checkbox-group[data-id=${this.id}]`)
    }
    
    selectedWeekDays = []

    get weekdays() {
        return [
            { label: 'Monday', value: 'MON' },
            { label: 'Tuesday', value: 'TUE' },
            { label: 'Wednesday', value: 'WED' },
            { label: 'Thursday', value: 'THU' },
            { label: 'Friday', value: 'FRI' },
            { label: 'Saturday', value: 'SAT' },
            { label: 'Sunday', value: 'SUN' }
        ]
    }

    handleWeekDaySelect(e) {
        this.selectedWeekDays = e.detail.value
    }

    @api 
    get value() {
        return this.getCheckboxGroup().value;
    }

    @api
    checkValidity() {
        return this.getCheckboxGroup().checkValidity()
    }
}