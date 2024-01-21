import * as bcrypt from 'bcrypt';
import * as EmailValidator from 'email-validator';
import {
  CheckPassword,
  Compare,
  Encrypt,
  TokenGenerator,
} from '../../interface/base/baseInterface';
import { CpfVeri } from 'src/util/cpf';
import { DateManipulator } from 'src/util/date';
import nodemailer from 'nodemailer';

export class BaseService {
  encrypt(password: string): Encrypt {
    const saltRounds = 10;
    const encry = bcrypt.hashSync(password, saltRounds);
    return encry;
  }

  checkPassword(password: string): CheckPassword {
    const regexUppercase = /[A-Z]/;
    const regexSpecialSymbol = /[^a-zA-Z0-9]/;
    if (
      password.length >= 8 &&
      regexUppercase.test(password) &&
      regexSpecialSymbol.test(password)
    ) {
      return true;
    }

    return false;
  }

  async compare(passaword: string, hash: string): Promise<Compare> {
    const compare = await bcrypt.compare(passaword, hash);
    return compare;
  }

  emailValidate(email: string): boolean {
    const valide = EmailValidator.validate(email);
    if (valide) return true;
    if (!valide) return false;
    return false;
  }
  tokenGenerator(): TokenGenerator {
    const length = 6;
    const characters = '0123456789';
    let token = '';
    for (let i = 0; i < length; i++) {
      const randomIndex = Math.floor(Math.random() * characters.length);
      token += characters.charAt(randomIndex);
    }
    return token;
  }
  cpfReader(idUsuario: string): boolean {
    const validate = new CpfVeri();
    return validate.verify(idUsuario);
  }
  dateGenerator(): string {
    const date = new DateManipulator();
    return date.YMD();
  }
  dateGeneratorDMY(): string {
    const date = new DateManipulator();
    const DMY = date.DMY();
    const term = 10 + parseInt(DMY.day);
    return `${term}-${DMY.month}-${DMY.year}`;
  }
  sendMail(email: string, txt: string, subject: string): Object {
    const configMail = this.configMail();
    const mailOptions = {
      from: configMail.sender.email,
      to: email,
      subject: subject,
      text: txt,
    };
    configMail.transporter.sendMail(mailOptions, (error: any, info: any) => {
      if (error) {
        throw new Error(error);
      }
    });
    return { response: 'Email Enviado' };
  }
  private configMail(): any {
    const sender = {
      email: process.env.EMAIL,
      password: process.env.PASSWORD,
    };
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: sender.email,
        pass: sender.password,
      },
    });
    return { sender: sender, transporter: transporter };
  }
}
