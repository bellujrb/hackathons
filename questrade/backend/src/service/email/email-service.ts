import { Injectable } from '@nestjs/common';
import { BaseService } from '../base/baseService';
import { LoanEntity } from 'src/entity/loan/loan-entity';

@Injectable()
export class EmailService extends BaseService {
  constructor(
    private repositoryLoan: LoanEntity,
  ) {
    super();
  }
  async mailSuport(email: string) {
    const loan = await this.repositoryLoan.getLoanUser(email);
    const txt = `Dear ${loan.name},

    Thank you for reaching out to our support team. We are here to assist you with any questions or issues you may have regarding our products/services.
    
    We have received your support request and would like to inform you that our team is already working to address your concern as quickly as possible.
    
    We understand that your request is important, and we will do our best to provide a suitable solution. Our support team will be in touch with you shortly to gather further information or provide necessary instructions to resolve the issue.
    
    In the meantime, if you have any additional information that could help us better understand the situation or if there have been any changes in the nature of the problem, please let us know promptly. This will enable us to take more effective action in resolving your issue.
    
    We appreciate your patience and understanding throughout this process. We are committed to providing exceptional support service and ensuring your satisfaction.
    
    If you have any further questions or need additional information, please feel free to contact us through the available support channels. We will do our best to assist you promptly.
    
    Thank you once again for reaching out to us. We are dedicated to providing the best assistance possible.
    
    Questrade
    `;
    const subject = 'Support Assistance - Request Received';
    super.sendMail(email, txt, subject);
    return { res: 'E-mail was sent', status: 200 };
  }
  async mailIsValid(email: string) {
    const loan = await this.repositoryLoan.getLoanUser(email);
    const txt = `Dear ${loan.name},
    
    We are pleased to inform you that we have completed the analysis of your loan application. We are happy to let you know that your loan has been approved! Congratulations!
    
    Loan Details:
    
    Loan Amount: ${loan.name}
    Interest Rate: 1.1% per month And 15% per year
    Loan Term:${super.dateGeneratorDMY()}
    Repayment Schedule: ${loan.name}
    
    We have thoroughly reviewed your application and based on our assessment, we are confident that this loan will provide you with the financial support you need.
    
    We appreciate the opportunity to assist you with your financial needs, and we assure you that we will handle your loan with the utmost professionalism and confidentiality.
    
    If you have any questions or need further assistance, please feel free to contact our dedicated loan officers. We are here to help you throughout the loan process.
    
    Thank you for choosing our institution for your borrowing requirements. We look forward to a successful lending relationship.
    
    Best regards,

    Questrade
    Support in app`;

    const subject = 'Your loan is all set';
    super.sendMail(email, txt, subject);
    return { res: 'E-mail was sent', status: 200 };
  }
}
