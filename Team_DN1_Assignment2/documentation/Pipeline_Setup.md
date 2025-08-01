# Dataflow Pipeline Setup: Sales Data Processing

This document outlines the setup for the Dataflow pipeline designed to process sales data, read from a CSV file in Google Cloud Storage (GCS), transform it, and write it to BigQuery.

## Pipeline Description

The pipeline performs the following steps:

1.  **ReadFromGCS:** Reads a CSV file from a specified GCS bucket.
2.  **ParseCSV:** Parses each line of the CSV file into a list of values.
3.  **FilterNulls:** Filters out any null or empty rows that result from parsing.
4.  **TransformDate:** Transforms the data by converting data types and extracting relevant fields. Specifically, it converts the date string to a `datetime.date` object.
5.  **WriteToBigQuery:** Writes the transformed data to a BigQuery table.

## Code Snippet

Here's the core pipeline definition in Python:

```python
import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
import csv
from datetime import datetime


def parse_csv(line):
    try:
        return next(csv.reader([line]))
    except Exception:
        return None

def run():
    options = PipelineOptions(
        runner='DataflowRunner',
        project='mgmt599-dn1-lab2',
        region='us-central1',
        temp_location='gs://mgmt599-dn1-lab2-datalake/pipeline_temp',
        staging_location='gs://mgmt599-dn1-lab2-datalake/pipeline_staging',
        save_main_session=True
    )

    with beam.Pipeline(options=options) as pipeline:
        (
            pipeline
            | 'ReadFromGCS' >> beam.io.ReadFromText(
                'gs://mgmt599-dn1-lab2-datalake/train.csv', skip_header_lines=1)
            | 'ParseCSV' >> beam.Map(parse_csv)
            | 'FilterNulls' >> beam.Filter(lambda x: x is not None)
            | 'TransformDate' >> beam.Map(lambda record: {
                'ID': int(record[0]),
                'Date': datetime.strptime(record[1], '%Y-%m-%d').date() if record[1] else None,
                'StoreNumber': int(record[2]),
                'Family': str(record[3]),
                'Sales': float(record[4]) if record[4] else None,
                'Onpromotion': int(record[5])
            }
        )


            
            | 'WriteToBigQuery' >> beam.io.WriteToBigQuery(
                'mgmt599-dn1-lab2.store_sales_team_dn1.sales_data',
                schema='ID:INTEGER, Date:DATE, StoreNumber:INTEGER, Family:STRING, Sales:FLOAT, Onpromotion:INTEGER',
                write_disposition=beam.io.BigQueryDisposition.WRITE_TRUNCATE,
                create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED
            )
        )

if __name__ == '__main__':
    run()
```

## Configuration

The following configurations are used in the pipeline:

*   **Runner:** `DataflowRunner` - Specifies that the pipeline will be executed using the Dataflow service.
*   **Project:** `mgmt599-dn1-lab2` -  GCP project ID.
*   **Region:** `us-central1` - GCP region where the Dataflow job will run.
*   **temp_location:** `gs://mgmt599-dn1-lab2-datalake/pipeline_temp` - GCS path for temporary files.
*   **staging_location:** `gs://mgmt599-dn1-lab2-datalake/pipeline_staging` - GCS path for staging the pipeline.
*   **Input File:** `gs://mgmt599-dn1-lab2-datalake/train.csv` - The GCS path to the input CSV file.
*   **BigQuery Table:** `mgmt599-dn1-lab2.store_sales_team_dn1.sales_data` - The BigQuery table where the transformed data will be written.
*   **BigQuery Schema:** `ID:INTEGER, Date:DATE, StoreNumber:INTEGER, Family:STRING, Sales:FLOAT, Onpromotion:INTEGER` - The schema for the BigQuery table.

## Data Transformation Details

The `TransformDate` step converts the date string from the input CSV file to a BigQuery-compatible DATE format. It also handles potential missing values in the `Sales` column by setting them to `None` if they are empty.

## Error Handling

The `parse_csv` function includes a try-except block to handle potential errors during CSV parsing.  Rows that cannot be parsed are skipped.

## Dependencies

The pipeline relies on the following Apache Beam libraries:

*   `apache_beam`
*   `apache_beam.options.pipeline_options`

It also uses the standard `csv` and `datetime` libraries in Python.

## Notes

*   Ensure that the GCS bucket and BigQuery dataset exist before running the pipeline.
*   The BigQuery table will be truncated and overwritten each time the pipeline runs due to the `WRITE_TRUNCATE` write disposition.  Consider changing this to `WRITE_APPEND` for incremental updates.
*   The pipeline assumes that the input CSV file has a header row, which is skipped using the `skip_header_lines=1` option.