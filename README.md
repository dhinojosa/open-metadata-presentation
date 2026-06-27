# DataMesh Open Metadata Presentation

This repository contains materials for a DataMesh Open Metadata Presentation.

## License

This project is licensed under the MIT License.

## Presentation

Slide deck is located in the repository, and the demo goes along with it.

## List of People

![people.png](/images/people.png)

| Name | Role | Email | Password |
|---|---|---|---|
| Priya Patel | Customer Domain Data Owner | priya@abccorp.com | priya123 |
| Jamal Washington | Ordering Domain Data Owner | jamal@abccorp.com | jamal123 |
| Aisha Hassan | Inventory Domain Data Owner | aisha@abccorp.com | aisha123 |
| Mei Chen | Data Governance Lead | mei@abccorp.com | mei123 |
| Miguel Rodriguez | Platform Engineering (Shared Services) | miguel@abccorp.com | miguel123 |
| Steven Appleton | Data Engineering (Shared Services) | steven@abccorp.com | steven123 |

## Demos

### Demo 1: Starting Open Metadata

1. Start Docker-Compose with `docker-compose up -d`
2. Open OpenMetadata with http://localhost:8585
3. Login with the following credentials:

   a. Username: `admin@open-metadata.org`

   b. Password: `admin`

4. Once logged in, go to the ingestion bot page http://localhost:8585/bots/ingestion-bot
5. Copy the JWT token from the ingestion bot page.
6. Open a terminal and export the token
   
   ```bash
   export OPENMETADATA_JWT_TOKEN=<JWT_TOKEN>
   ```
7. Run the script `load-openmetadata-users.sh` 

  ```bash
   ./load-openmetadata-users.sh
  ```
8. Verify the Users are loaded

### Demo 2: Logging into Open Metadata

1. Show the layout *Home*.
   a. A search bar to locate any or all tables, schemas.
   b. *Activity Feed* - ???
   c. *Data Assets* - ???
   d. *My Data* - ???
   e. *KPI* - ???
   f. *Total Data Assets* - ???  
   g. *Following Assets* - ???
2. Show the layout *Explore*.
   a. Show Data Assets Window
   b. Show Filtering: Data Assets, Domains, Owners, Tag, Tier, Certification, Service, and Service Type 
3. Show *Service Lineage*
   a. Locate a Data Asset
   b. View Service Lineage in the main window
