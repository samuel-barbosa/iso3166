# ISO-3166 Subdivision Extractor

This repository contains a script to extract country subdivisions based on their ISO-3166 alpha-2 codes. The script queries the ISO.org database and generates the subdivisions in CSV format.

The ISO-3166 standard defines codes for the names of countries, dependencies, geographic areas of interest, and their main administrative subdivisions. This script focuses on extracting administrative subdivisions.

## Features

- Extracts subdivisions for countries using their ISO-3166 alpha-2 codes.
- Generates data in CSV format with the following columns:
    - `category`: Subdivision category (e.g., state, province).
    - `3166-2-code`: ISO-3166-2 code of the subdivision.
    - `name`: Name of the subdivision.
    - `local variant`: Name of the subdivision in the local language (if available).
    - `language code`: Local language code.
    - `romanization system`: Romanization system used (if applicable).
    - `parent subdivision`: Parent subdivision code (if applicable).
- Handles multiple country codes provided via standard input.

## Dependencies

The script requires the following tools to be installed:

- `curl`: For making HTTP requests.
- `jq`: For processing JSON data.
- `yq`: For parsing HTML as XML and converting to JSON.

## Usage

1. Provide a list of country codes (ISO-3166 alpha-2) via standard input.
2. Run the script to extract the subdivisions.

### Example

```bash
echo -e 'BR\nUS\nIT' | ./iso3166-subdivisions.sh
```

This will generate a CSV with the subdivisions of Brazil, United States, and Italy.

### Input File

You can use the `all-country-codes.dat` file for a complete list of ISO-3166 alpha-2 country codes.

Example usage with `all-country-codes.dat`:

```bash
./iso3166-subdivisions.sh <all-country-codes.dat > subdivisions.csv
```

This command will read the country codes from the `all-country-codes.dat` file, run the `iso3166-subdivisions.sh` script, and save the output to the `subdivisions.csv` file.

## Script Details: `iso3166-subdivisions.sh`

- Queries the ISO.org database using `curl`.
- Processes the response using `jq` and `yq` to extract subdivision data.
- Generates the data in CSV format.

## File: `all-country-codes.dat`

Contains a list of all ISO-3166 alpha-2 country codes.

## Notes

- Make sure you have internet access to query the ISO.org database.
- The script exits silently if no input is provided via standard input.

## Troubleshooting

- **Connection error:** Check your internet connection and whether the ISO.org website is accessible.
- **Missing dependencies:** Ensure that `curl`, `jq`, and `yq` are properly installed.
- **Incorrect input format:** Make sure the input file contains only valid ISO-3166 alpha-2 country codes, one per line.

## Contributing

If you wish to contribute to this project, feel free to open a pull request with your changes. 
