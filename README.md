# Github action for Scaleway s3cmd

```yaml
- name: S3 bucket listing
  uses: remyleone/scw-s3cmd-action@v0.0.1
  with:
    args: ls s3://mybucket
  env:
    SCW_ACCESS_KEY: ${{ secrets.SCW_ACCESS_KEY }}
    SCW_SECRET_KEY: ${{ secrets.SCW_SECRET_KEY }}
    SCW_REGION: "fr-par"
```

### Secrets

- `SCW_ACCESS_KEY` – **Required**: a Scaleway API token ([more info](https://www.scaleway.com/en/docs/generate-an-api-token/)).
- `SCW_SECRET_KEY` – **Required**: Scaleway API token ([more info](https://www.scaleway.com/en/docs/generate-an-api-token/)).
- `SCW_REGION` – **Required**: The region of the S3 bucket (for instance `fr-par`, `nl-ams`, `pl-waw`, ...)
