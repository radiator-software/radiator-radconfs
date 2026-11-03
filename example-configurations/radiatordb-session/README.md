RadiatorDB example for Radiator Policy Server and Radiator Core with sessions, client and subscriber collections

NOTE: Select "Management configuration (management/)" checkbox when importing.

## Permissions
RadiatorDB has separate permissions from Radiator UI. The permissions defined for the management users must match to RadiatorDB collection roles.

## Clients
In this example the RADIUS clients are stored in RadiatorDB instead of static file.
Adding and modifying RADIUS clients can be done from RadiatorDB > NAS Clients collection. Changes to the NAS client collection are automatically polled in 5 minute intervals.

## Configuration
Policy configuration in `50_policies.radconf`
  - SUBSCRIBERS policy for authenticating subscribers with pap authentication, and returning reply attributes from subscriber information in RadiatorDB
  - SESSIONS policy for storing session data to RadiatorDB Sessions collection
  - DEFAULT policy for catching requests, which do not match other policies

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
