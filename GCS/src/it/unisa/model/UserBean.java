package it.unisa.model;

public class UserBean {
	
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String address;
    private String phoneNumber;
    private String PAN;
    private String expDate;
    private String CVV;
    
    public boolean valid;
	
	
    public String getFirstName() {
       return firstName;
	}

    public void setFirstName(String newFirstName) {
       firstName = newFirstName;
	}

	
    public String getLastName() {
       return lastName;
			}

    public void setLastName(String newLastName) {
       lastName = newLastName;
			}
			

    public String getPassword() {
       return password;
	}

    public void setPassword(String newPassword) {
       password = newPassword;
	}
	
			
    public String getEmail() {
       return email;
			}

    public void setEmail(String newemail) {
       email = newemail;
			}
    
    public String getAddress() {
        return address;
 	}

    public void setAddress(String newAddress) {
        address = newAddress;
 	}

    public String getPhoneNumber() {
        return phoneNumber;
 	}

    public void setPhoneNumber(String newPhoneNumber) {
        phoneNumber = newPhoneNumber;
 	}
    
    public String getPAN() {
        return PAN;
 	}

    public void setPAN(String newPAN) {
        PAN = newPAN;
 	}
     
    public String getExpDate() {
         return expDate;
  	}

    public void setExpDate(String newExpDate) {
         expDate = newExpDate;
  	}
    
    public String getCVV() {
        return CVV;
 	}

    public void setCVV(String newCVV) {
        CVV = newCVV;
 	}
				
    public boolean isValid() {
       return valid;
	}

    public void setValid(boolean newValid) {
       valid = newValid;
	}	
}
