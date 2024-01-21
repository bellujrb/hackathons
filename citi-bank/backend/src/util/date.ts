export class DateManipulator {
    private createDate() {
      const currentDate = new Date();
  
      const year = currentDate.getFullYear();
      const month = String(currentDate.getMonth() + 1).padStart(2, "0");
      const day = String(currentDate.getDate()).padStart(2, "0");
  
      const hours = String(currentDate.getHours()).padStart(2, "0");
      const minutes = String(currentDate.getMinutes()).padStart(2, "0");
      const seconds = String(currentDate.getSeconds()).padStart(2, "0");
  
      return {
        year: year,
        month: month,
        day: day,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
      };
    }
    YMDHMS() {
      const date = this.createDate();
      return (`${date.year}${date.month}${date.day}${date.hours}${date.minutes}${date.seconds}`);
    }
    S() {
      const date = this.createDate();
      return (`${date.seconds}`);
    }
    HMS() {
      const date = this.createDate();
      return (`${date.hours}:${date.minutes}:${date.seconds}`);
    }
    DHMS() {
      const date = this.createDate();
      return (`${date.day} - ${date.hours}:${date.minutes}:${date.seconds}`);
    }
    HM() {
      const date = this.createDate();
      return (`${date.hours}:${date.minutes}`);
    }
  }
  
  
  