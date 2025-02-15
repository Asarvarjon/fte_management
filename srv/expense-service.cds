using { expense.tracker as db } from '../db/schema';

service ExpenseService {

  @readonly
  entity Users as projection on db.User;

  entity Expenses as projection on db.Expense {
    ID, title, amount, currency, date, category, receiptUrl, status, requestedBy, approvedBy
  };

  entity Categories as projection on db.Category;
  
  entity Approvals as projection on db.Approval;

  entity CurrencyRates as projection on db.CurrencyRate;

  action ApproveExpense(expenseID: UUID, decision: String(20), comments: String) returns String;

  action UploadReceipt(expenseID: UUID, receiptUrl: String) returns String;
}
