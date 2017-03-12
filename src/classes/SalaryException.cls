public class SalaryException extends Exception {
    public string getErrorMessage(){
        return 'Please check...Salary should be more than 1000';
    }
    public string getExType(){
        return 'Salary Exception';
    }
}