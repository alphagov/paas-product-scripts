# GOV.UK PaaS Product Scripts

This is a set of useful scripts for running locally to work out what users are up to and diagnosing problems.

They are not remotely "Production Ready" but it's better to have them in github than not.

Largely based on work from Lee and Graham

## Running locally

- You'll need to be logged into CloudFoundry
- You'll need global-auditor role

## The Scripts

### crashed_list.sh
Will ask for a start and end time, then list all crashed events between the two times. Useful for getting an overview if there's a peak in app crashes on the metrics dashboard.

### crashed_detail.sh
Much more detailed report into other things that were happening around the time of each crash. Hard to understand if you don't know what you're looking for from the report above.

### what-org.sh
Gets the details of an Org when provided with a GUID extracted from crashed_list above.

### what-space.sh
Go on, guess.

### listnondefaultquotas.sh
A report that will pull out all organisations that aren't in "trial" mode.

### servicelist.sh
Report that works through every org and space, getting the apps and services for each.

Output will contain org admin names for every service on PaaS, so be **Very** careful with data at rest, and don't accidentally commit this report back to GitHub!!!!

### userlist.sh
An early version of servicelist.sh. Needs a bit of fixing up still.
