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

This will generate a CSV with the subdivisions of Brazil, United States, and Italy:

```csv
"category","3166-2-code","name","local variant","language code","romanization system","parent subdivision"
"state","BR-AC","Acre",,"pt",,
"state","BR-AL","Alagoas",,"pt",,
"state","BR-AP","Amapá",,"pt",,
"state","BR-AM","Amazonas",,"pt",,
"state","BR-BA","Bahia",,"pt",,
"state","BR-CE","Ceará",,"pt",,
"federal district","BR-DF","Distrito Federal",,"pt",,
"state","BR-ES","Espírito Santo",,"pt",,
"state","BR-GO","Goiás",,"pt",,
"state","BR-MA","Maranhão",,"pt",,
"state","BR-MT","Mato Grosso",,"pt",,
"state","BR-MS","Mato Grosso do Sul",,"pt",,
"state","BR-MG","Minas Gerais",,"pt",,
"state","BR-PR","Paraná",,"pt",,
"state","BR-PB","Paraíba",,"pt",,
"state","BR-PA","Pará",,"pt",,
"state","BR-PE","Pernambuco",,"pt",,
"state","BR-PI","Piauí",,"pt",,
"state","BR-RN","Rio Grande do Norte",,"pt",,
"state","BR-RS","Rio Grande do Sul",,"pt",,
"state","BR-RJ","Rio de Janeiro",,"pt",,
"state","BR-RO","Rondônia",,"pt",,
"state","BR-RR","Roraima",,"pt",,
"state","BR-SC","Santa Catarina",,"pt",,
"state","BR-SE","Sergipe",,"pt",,
"state","BR-SP","São Paulo",,"pt",,
"state","BR-TO","Tocantins",,"pt",,
"state","US-AL","Alabama",,"en",,
"state","US-AK","Alaska",,"en",,
"outlying area","US-AS","American Samoa (see also separate country code entry under AS)",,"en",,
"state","US-AZ","Arizona",,"en",,
"state","US-AR","Arkansas",,"en",,
"state","US-CA","California",,"en",,
"state","US-CO","Colorado",,"en",,
"state","US-CT","Connecticut",,"en",,
"state","US-DE","Delaware",,"en",,
"district","US-DC","District of Columbia",,"en",,
"state","US-FL","Florida",,"en",,
"state","US-GA","Georgia",,"en",,
"outlying area","US-GU","Guam (see also separate country code entry under GU)",,"en",,
"state","US-HI","Hawaii",,"en",,
"state","US-ID","Idaho",,"en",,
"state","US-IL","Illinois",,"en",,
"state","US-IN","Indiana",,"en",,
"state","US-IA","Iowa",,"en",,
"state","US-KS","Kansas",,"en",,
"state","US-KY","Kentucky",,"en",,
"state","US-LA","Louisiana",,"en",,
"state","US-ME","Maine",,"en",,
"state","US-MD","Maryland",,"en",,
"state","US-MA","Massachusetts",,"en",,
"state","US-MI","Michigan",,"en",,
"state","US-MN","Minnesota",,"en",,
"state","US-MS","Mississippi",,"en",,
"state","US-MO","Missouri",,"en",,
"state","US-MT","Montana",,"en",,
"state","US-NE","Nebraska",,"en",,
"state","US-NV","Nevada",,"en",,
"state","US-NH","New Hampshire",,"en",,
"state","US-NJ","New Jersey",,"en",,
"state","US-NM","New Mexico",,"en",,
"state","US-NY","New York",,"en",,
"state","US-NC","North Carolina",,"en",,
"state","US-ND","North Dakota",,"en",,
"outlying area","US-MP","Northern Mariana Islands (see also separate country code entry under MP)",,"en",,
"state","US-OH","Ohio",,"en",,
"state","US-OK","Oklahoma",,"en",,
"state","US-OR","Oregon",,"en",,
"state","US-PA","Pennsylvania",,"en",,
"outlying area","US-PR","Puerto Rico (see also separate country code entry under PR)",,"en",,
"state","US-RI","Rhode Island",,"en",,
"state","US-SC","South Carolina",,"en",,
"state","US-SD","South Dakota",,"en",,
"state","US-TN","Tennessee",,"en",,
"state","US-TX","Texas",,"en",,
"outlying area","US-UM","United States Minor Outlying Islands (see also separate country code entry under UM)",,"en",,
"state","US-UT","Utah",,"en",,
"state","US-VT","Vermont",,"en",,
"outlying area","US-VI","Virgin Islands, U.S. (see also separate country code entry under VI)",,"en",,
"state","US-VA","Virginia",,"en",,
"state","US-WA","Washington",,"en",,
"state","US-WV","West Virginia",,"en",,
"state","US-WI","Wisconsin",,"en",,
"state","US-WY","Wyoming",,"en",,
"region","IT-65","Abruzzo",,"it",,
"free municipal consortium","IT-AG","Agrigento",,"it",,"IT-82"
"province","IT-AL","Alessandria",,"it",,"IT-21"
"province","IT-AN","Ancona",,"it",,"IT-57"
"province","IT-AR","Arezzo",,"it",,"IT-52"
"province","IT-AP","Ascoli Piceno",,"it",,"IT-57"
"province","IT-AT","Asti",,"it",,"IT-21"
"province","IT-AV","Avellino",,"it",,"IT-72"
"metropolitan city","IT-BA","Bari",,"it",,"IT-75"
"province","IT-BT","Barletta-Andria-Trani",,"it",,"IT-75"
"region","IT-77","Basilicata",,"it",,
"province","IT-BL","Belluno",,"it",,"IT-34"
"province","IT-BN","Benevento",,"it",,"IT-72"
"province","IT-BG","Bergamo",,"it",,"IT-25"
"province","IT-BI","Biella",,"it",,"IT-21"
"metropolitan city","IT-BO","Bologna",,"it",,"IT-45"
"autonomous province","IT-BZ","Bolzano",,"it",,"IT-32"
"autonomous province","IT-BZ","Bozen",,"de",,"IT-32"
"province","IT-BS","Brescia",,"it",,"IT-25"
"province","IT-BR","Brindisi",,"it",,"IT-75"
"metropolitan city","IT-CA","Cagliari",,"it",,"IT-88"
"region","IT-78","Calabria",,"it",,
"free municipal consortium","IT-CL","Caltanissetta",,"it",,"IT-82"
"region","IT-72","Campania",,"it",,
"province","IT-CB","Campobasso",,"it",,"IT-67"
"province","IT-CE","Caserta",,"it",,"IT-72"
"metropolitan city","IT-CT","Catania",,"it",,"IT-82"
"province","IT-CZ","Catanzaro",,"it",,"IT-78"
"province","IT-CH","Chieti",,"it",,"IT-65"
"province","IT-CO","Como",,"it",,"IT-25"
"province","IT-CS","Cosenza",,"it",,"IT-78"
"province","IT-CR","Cremona",,"it",,"IT-25"
"province","IT-KR","Crotone",,"it",,"IT-78"
"province","IT-CN","Cuneo",,"it",,"IT-21"
"region","IT-45","Emilia-Romagna",,"it",,
"free municipal consortium","IT-EN","Enna",,"it",,"IT-82"
"province","IT-FM","Fermo",,"it",,"IT-57"
"province","IT-FE","Ferrara",,"it",,"IT-45"
"metropolitan city","IT-FI","Firenze",,"it",,"IT-52"
"province","IT-FG","Foggia",,"it",,"IT-75"
"province","IT-FC*","Forlì-Cesena",,"it",,"IT-45"
"autonomous region","IT-36","Friuli Venezia Giulia",,"it",,
"province","IT-FR","Frosinone",,"it",,"IT-62"
"metropolitan city","IT-GE","Genova",,"it",,"IT-42"
"decentralized regional entity","IT-GO","Gorizia",,"it",,"IT-36"
"province","IT-GR","Grosseto",,"it",,"IT-52"
"province","IT-IM","Imperia",,"it",,"IT-42"
"province","IT-IS","Isernia",,"it",,"IT-67"
"province","IT-AQ","L'Aquila",,"it",,"IT-65"
"province","IT-SP","La Spezia",,"it",,"IT-42"
"province","IT-LT","Latina",,"it",,"IT-62"
"region","IT-62","Lazio",,"it",,
"province","IT-LE","Lecce",,"it",,"IT-75"
"province","IT-LC","Lecco",,"it",,"IT-25"
"region","IT-42","Liguria",,"it",,
"province","IT-LI","Livorno",,"it",,"IT-52"
"province","IT-LO","Lodi",,"it",,"IT-25"
"region","IT-25","Lombardia",,"it",,
"province","IT-LU","Lucca",,"it",,"IT-52"
"province","IT-MC","Macerata",,"it",,"IT-57"
"province","IT-MN","Mantova",,"it",,"IT-25"
"region","IT-57","Marche",,"it",,
"province","IT-MS","Massa-Carrara",,"it",,"IT-52"
"province","IT-MT","Matera",,"it",,"IT-77"
"metropolitan city","IT-ME","Messina",,"it",,"IT-82"
"metropolitan city","IT-MI","Milano",,"it",,"IT-25"
"province","IT-MO","Modena",,"it",,"IT-45"
"region","IT-67","Molise",,"it",,
"province","IT-MB","Monza e Brianza",,"it",,"IT-25"
"metropolitan city","IT-NA","Napoli",,"it",,"IT-72"
"province","IT-NO","Novara",,"it",,"IT-21"
"province","IT-NU","Nuoro",,"it",,"IT-88"
"province","IT-OR","Oristano",,"it",,"IT-88"
"province","IT-PD","Padova",,"it",,"IT-34"
"metropolitan city","IT-PA","Palermo",,"it",,"IT-82"
"province","IT-PR","Parma",,"it",,"IT-45"
"province","IT-PV","Pavia",,"it",,"IT-25"
"province","IT-PG","Perugia",,"it",,"IT-55"
"province","IT-PU","Pesaro e Urbino",,"it",,"IT-57"
"province","IT-PE","Pescara",,"it",,"IT-65"
"province","IT-PC","Piacenza",,"it",,"IT-45"
"region","IT-21","Piemonte",,"it",,
"province","IT-PI","Pisa",,"it",,"IT-52"
"province","IT-PT","Pistoia",,"it",,"IT-52"
"decentralized regional entity","IT-PN","Pordenone",,"it",,"IT-36"
"province","IT-PZ","Potenza",,"it",,"IT-77"
"province","IT-PO","Prato",,"it",,"IT-52"
"region","IT-75","Puglia",,"it",,
"free municipal consortium","IT-RG","Ragusa",,"it",,"IT-82"
"province","IT-RA","Ravenna",,"it",,"IT-45"
"metropolitan city","IT-RC","Reggio Calabria",,"it",,"IT-78"
"province","IT-RE","Reggio Emilia",,"it",,"IT-45"
"province","IT-RI","Rieti",,"it",,"IT-62"
"province","IT-RN","Rimini",,"it",,"IT-45"
"metropolitan city","IT-RM","Roma",,"it",,"IT-62"
"province","IT-RO","Rovigo",,"it",,"IT-34"
"province","IT-SA","Salerno",,"it",,"IT-72"
"autonomous region","IT-88","Sardegna",,"it",,
"province","IT-SS","Sassari",,"it",,"IT-88"
"province","IT-SV","Savona",,"it",,"IT-42"
"autonomous region","IT-82","Sicilia",,"it",,
"province","IT-SI","Siena",,"it",,"IT-52"
"free municipal consortium","IT-SR","Siracusa",,"it",,"IT-82"
"province","IT-SO","Sondrio",,"it",,"IT-25"
"province","IT-SU","Sud Sardegna",,"it",,"IT-88"
"province","IT-TA","Taranto",,"it",,"IT-75"
"province","IT-TE","Teramo",,"it",,"IT-65"
"province","IT-TR","Terni",,"it",,"IT-55"
"metropolitan city","IT-TO","Torino",,"it",,"IT-21"
"region","IT-52","Toscana",,"it",,
"free municipal consortium","IT-TP","Trapani",,"it",,"IT-82"
"autonomous region","IT-32","Trentino-Alto Adige",,"it",,
"autonomous region","IT-32","Trentino-Südtirol",,"de",,
"autonomous province","IT-TN","Trento",,"it",,"IT-32"
"province","IT-TV","Treviso",,"it",,"IT-34"
"decentralized regional entity","IT-TS","Trieste",,"it",,"IT-36"
"decentralized regional entity","IT-UD","Udine",,"it",,"IT-36"
"region","IT-55","Umbria",,"it",,
"autonomous region","IT-23","Val d'Aoste",,"fr",,
"autonomous region","IT-23","Valle d'Aosta",,"it",,
"province","IT-VA","Varese",,"it",,"IT-25"
"region","IT-34","Veneto",,"it",,
"metropolitan city","IT-VE","Venezia",,"it",,"IT-34"
"province","IT-VB","Verbano-Cusio-Ossola",,"it",,"IT-21"
"province","IT-VC","Vercelli",,"it",,"IT-21"
"province","IT-VR","Verona",,"it",,"IT-34"
"province","IT-VV","Vibo Valentia",,"it",,"IT-78"
"province","IT-VI","Vicenza",,"it",,"IT-34"
"province","IT-VT","Viterbo",,"it",,"IT-62"
```

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
