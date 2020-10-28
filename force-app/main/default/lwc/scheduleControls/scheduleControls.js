import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import launchNow from '@salesforce/apex/GridXInterviewLauncherController.launchNow'
import scheduleJob from '@salesforce/apex/GridXInterviewLauncherController.scheduleJob'

export default class ScheduleControls extends LightningElement {
    pickers = [
        'weekdayspicker',
        'timepicker'
    ]

    getValues() {
        const values = {}
        this.pickers.forEach((picker) => {
            const pickerComponent = this.template.querySelector(`[data-id=${picker}]`)
            values[picker] = pickerComponent.value
        })
        return values
    }

    getValidity() {
        let isValid = true
        this.pickers.forEach((picker) => {
            const pickerComponent = this.template.querySelector(`[data-id=${picker}]`)
            isValid = isValid && pickerComponent.checkValidity()
        })
        return isValid
    }

    schedule() {
        if (this.getValidity()) {
            scheduleJob({
                "pickersJson":JSON.stringify(this.getValues())
            }).then((result) => {
                this.showToast('Success', `the job ${result} is scheduled`, 'success')
            }).catch((error) => {
                this.showToast('Error', error.body.message, 'error')
            })
        } else {
            this.showToast('Error', 'Please fill the form correctly', 'error')
        }
    }

    launchnow() {
        launchNow()
            .then((result) => {
                this.showToast('Success', `the job ${result} is scheduled`, 'success')
            })
            .catch((error) => {
                this.showToast('Error', error.body.message, 'error')
            })
    }

    showToast(title, message, variant) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(evt);
    }
}