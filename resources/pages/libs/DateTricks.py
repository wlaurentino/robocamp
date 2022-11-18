from datetime import date


class DateTricks():

    def get_start_date(self):
        today = date.today()

        # mm/dd/yyyy
        fdate = today.strftime('%m%d%Y')
        print(fdate)

        a_chars = ['1', '1', '1', '7', '2', '0', '2', '2']

        for number in fdate:
            a_chars.append(number)

        return a_chars
