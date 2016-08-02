# quickbooks data models

dbt data models for Quickbooks Online.

Currently, these models support transformation of a large number of Quickbooks objects into the corresponding journal transactions so that account flows and balances can be trended over time.

The data structures in this repo are built off of the [Stitch Quickbooks integration](https://www.stitchdata.com/integrations/quickbooks-online/). Other methods of denormalizing Quickbooks data could output slightly different data structures.

The most important model in this repository is `general_ledger`. This model is the running GL for all accounts and should likely form the basis of most analysis. We recommend materializing this model into a table to improve query performance times, as it can take some time to generate with moderate dataset sizes.


### installation

- modify your `profiles.yml` to include the following:
```YAML
repositories:
  - "git@github.com:fishtown-analytics/quickbooks.git"
```

- copy the models within the `base-models` directory into your dbt project and modify them so that they select from the appropriate tables and fields within your environment.
- run `dbt deps`.

### usage

Once installation is completed, `dbt run` will build these models along with the other models in your project.

### contribution

Additional contributions to this repo are very welcome! Please submit PRs to master. All PRs should only include functionality that is contained within all snowplow deployments; no implementation-specific details should be included.
