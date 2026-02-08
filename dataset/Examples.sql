# Table definition
CREATE TABLE dataset_pairs (
  id int NOT NULL AUTO_INCREMENT,                        # ID to facilitate identification of a pair
  feature_name varchar(255) NOT NULL,                    # Name to facilitate identification of pair by a human
  cypress_code longtext,                                 # The Cypress code
  gherkin_script longtext,                               # The Gherkin (BDD) script
  website varchar(255) DEFAULT NULL,                     # The target application tested
  complexity enum('Low','Medium','High') DEFAULT NULL,   # The complexity of the scenario based on Step-Count
  automated_source varchar(255) DEFAULT NULL,            # The source of the automated tests
  PRIMARY KEY (id),
  KEY feature_name (feature_name)
)

# See 5 entries with the longest cypress code
SELECT feature_name, LENGTH(cypress_code) as code_len 
FROM dataset_pairs 
ORDER BY code_len DESC 
LIMIT 5;

# See how many Low complexity pairs there are
SELECT COUNT(*) AS low_complexity_count
FROM dataset_pairs
WHERE complexity = 'Low';

# See how many Medium complexity pairs there are
SELECT COUNT(*) AS medium_complexity_count
FROM dataset_pairs
WHERE complexity = 'Medium';

# See how many High complexity pairs there are
SELECT COUNT(*) AS high_complexity_count
FROM dataset_pairs
WHERE complexity = 'High';

# See which websites are in the dataset
SELECT DISTINCT website
FROM dataset_pairs;

# See the names of the pairs
SELECT feature_name
FROM dataset_pairs;

# See how many pairs there are
SELECT COUNT(*)
FROM dataset_pairs;

# Select all data from a specific pair
SELECT * FROM dataset_pairs WHERE feature_name = "delete_item";

# Select only the Cypress code of a specific pair
SELECT cypress_code
FROM dataset_pairs 
WHERE feature_name = 'auth';

# See the tables columns
DESC dataset_pairs;


