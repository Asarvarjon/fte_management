namespace expense.tracker;

using { managed, cuid, temporal } from '@sap/cds/common';

entity User: cuid { 
  username       : String(50) @title : 'Username';
  email          : String(100);
  role           : String(20);
  createdAt      : Timestamp;
}

entity Expense : managed,cuid { 
  title         : String(255) @title : 'Expense Title';
  amount        : Decimal(10,2) @title : 'Amount';
  currency      : String(3); 
  date          : Date;
  category      : Association to Category;
  receiptUrl    : String(255); 
  status        : String(20);
  requestedBy   : Association to User;
  approvedBy    : Association to User;
}

entity Category: cuid {
  name          : String(50) @title : 'Category Name';
  description   : String(255);
}

entity Approval : managed, cuid { 
  expense       : Association to Expense;
  approvedBy    : Association to User;
  approvedAt    : Timestamp;
  decision      : String(20);
  comments      : String(255);
}

entity CurrencyRate {
  key currency  : String(3); // e.g., USD, EUR, GBP
  rateToUSD     : Decimal(10,4); // Conversion rate to USD
  updatedAt     : Timestamp;
}
