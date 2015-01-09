#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
#   This operation will return a list populated with all docker images
#   Inputs:
#       - host
#       - port - optional
#       - username
#       - password
#       - privateKeyFile - optional
#       - arguments - optional
#       - characterSet - optional
#       - pty - optional
#       - timeout - optional
#       - closeSession - optional
#   Outputs:
#       - imageList
#   Results:
#       - SUCCESS
#       - FAILURE
####################################################
namespace: org.openscore.slang.integrations.docker.images.get

operations:
    - get_all_images_op:
          inputs:
            - host
            - port: "'22'"
            - username
            - password
            - privateKeyFile: "''"
            - command: >
                "docker images -f \"dangling=true\" -q"
            - arguments: "''"
            - characterSet : "'UTF-8'"
            - pty: "'false'"
            - timeout: "'30000000'"
            - closeSession: "'false'"
          action:
            java_action:
              className: org.openscore.content.ssh.actions.SSHShellCommandAction
              methodName: runSshShellCommand
          outputs:
            - imageList: returnResult.replace("\n"," ").replace("<none>:<none> ","").replace("REPOSITORY:TAG ","")
          results:
            - SUCCESS
            - FAILURE