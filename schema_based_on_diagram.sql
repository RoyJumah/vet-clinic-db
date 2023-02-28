CREATE TABLE patients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(255) NOT NULL
);



