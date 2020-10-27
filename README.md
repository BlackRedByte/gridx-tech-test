# GridX Tech Test

Robert,

Hi, thanks for your time today, so here the technical test:

1. Create a developer environment on salesforce and create a user for me cesar.diaz@gridx.com and mustafa@gridx.com(if possible due to the limitations of the license)

2. Create and GitHub environment for the solution, sync, and share the link with cesar.diaz@gridx.com and mustafa@gridx.com .

3. The use case is: Generate a batch/async  process that can create/update Opportunites overnight:

a. Create a batch process that will create/update all opportunities with the following endpoint:

https://restcountries.eu/rest/v2/all

Mapping: ExtFieldName: Value: SFDC Field

"name": "Afghanistan",: Opportunity.Name
 "alpha3Code": "AFG",: Opportunity.ExtId__c(needs to be created on salesforce) for update and create operation
"Prospecting": Opportunity.StageName
"Today()+10": Opportunity.CloseDate

b. Create a lightning web components(if possible) interface where I can launch the process for a single test and in a timely manner, create a tab name "GridX Interview Launcher"

After it's done, please send details of task b.(above) for checking and for points #1 and #2.

Please let me know if you have any questions