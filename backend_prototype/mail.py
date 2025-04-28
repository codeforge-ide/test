# mail.py: Email sending (simulated)

class Mailer:
    def send(self, to, subject, body):
        print(f"Sending email to {to}: {subject}\n{body}")
        return {'message': 'Email sent'}
