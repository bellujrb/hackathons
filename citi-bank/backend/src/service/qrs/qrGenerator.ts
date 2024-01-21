import { Injectable } from '@nestjs/common';
import * as qrcode from 'qrcode';

@Injectable()
export class QrService {
  constructor() {}

  async qrCreate(data:any){
    const qr = await this.createBase64(data);
    return qr;
  }

  private async createBase64(text: any) {
    try {
      const qrCodeBuffer = await qrcode.toBuffer(text);
      const qrCodeBase64 = qrCodeBuffer.toString('base64');
      return qrCodeBase64;
    } catch (error) {
      throw new Error('Erro ao gerar o código QR');
    }
  }
}
