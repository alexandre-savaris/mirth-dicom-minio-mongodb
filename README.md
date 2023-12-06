# mirth-dicom-minio-mongodb
A [Mirth® Connect](https://www.nextgen.com/solutions/interoperability/mirth-integration-engine) channel to receive DICOM objects, sending their content to [MinIO](https://min.io/) and storing their alphanumerical tags into [MongoDB®](https://www.mongodb.com/).

No need for custom drivers or specific clients: The communication with both MinIO and MongoDB® happens through HTTP endpoints.

Mirth® Connect version = 4.4.0  
MinIO version = RELEASE.2023-11-15T20-43-25Z (go1.21.4 linux/amd64)  
MongoDB® version = 6.0.12 (Atlas)
