# Google Workspace Skill

Gerencie emails e arquivos do Google Workspace (Gmail e Drive).

## Descrição
Use esta skill para ler emails, enviar mensagens e gerenciar arquivos no Google Drive.

## Comandos

### �� Gmail (Himalaya)

#### Listar emails recentes
\\ash
himalaya list -s 5
\\n
#### Ler corpo de um email
\\ash
himalaya read <ID>
\\n
#### Enviar email
\\ash
echo " Corpo do email\ | himalaya send --subject \Assunto\ --to \destinatario@email.com\n\\n
### 📁 Google Drive (Rclone)

#### Listar arquivos na raiz
\\ash
rclone lsf geo_drive:
\\n
#### Procurar arquivo por nome
\\ash
rclone ls geo_drive: --include \*termo*\n\\n
#### Ler conteúdo de arquivo de texto
\\ash
rclone cat geo_drive:path/to/file.txt
\\n
#### Upload de arquivo
\\ash
rclone copy local_file.txt geo_drive:path/remote/
\\
