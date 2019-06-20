/*resource "aws_ssm_document" "HostnameWindows" {
  name          = "HostnameChangeWindows"
  document_type = "Command"

  content = <<DOC
  {
      "schemaVersion":"2.0",
      "description":"Run a Shell script to securely Changing the hostname for Windows instance",
      "mainSteps":[
         {
            "action":"aws:runPowerShellScript",
            "name":"runPowerShellScript",
            "inputs":{
               "runCommand":[
               "$currenthostname = hostname\n",
               "$instanceId = ((Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/instance-id -UseBasicParsing).Content)\n",
               "$newhostname = (aws ec2 describe-instances --instance-id $instanceId --region eu-west-3 --query 'Reservations[0].Instances[0].Tags[?Key==`hostname`].Value' --output text)\n",
               "Rename-computer –computername \"$currenthostname\" –newname \"$newhostname\"\n",
               "Restart-Computer -Force"
               ]
            }
         }
      ]
   }
DOC
}*/
