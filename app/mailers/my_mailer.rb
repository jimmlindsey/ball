class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: "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")
  end

  def new_user(user)
    template_id = "a6bf31b7-5742-46ea-bc1d-5d6ed4ec5fbe"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "USER_NAME",
            "-content-": user.username
          },
          "subject": "Thanks for Joining Hoopwall"
        }
      ],
      "from": {
        "email": "jim@hoopwall.com"
      },
      "template_id": template_id
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end
end
