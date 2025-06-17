#!/bin/bash
#set -ex
set -e

#cd /workspaces/${localWorkspaceFolderBasename}
#test -f package.json && npm install || echo 'No package.json found, skipping npm install'

<<<<<<< .mine
git config --global core.autocrlf false
git config --global core.filemode false

=======



>>>>>>> .theirs
# AWS SSO���O�C����get-caller-identity�̃G�C���A�X�ݒ�
# ��{�R�}���h�i�f�t�H���g�v���t�@�C���p�j
echo 'alias awslogin="aws sso login && echo \"���݂̔F�؏��:\" && aws sts get-caller-identity"' >> ~/.bashrc
#echo 'alias awslogin="aws sso login && echo \"���݂̔F�؏��:\" && aws sts get-caller-identity"' >> ~/.zshrc
echo 'alias awsid="aws sts get-caller-identity"' >> ~/.bashrc
#echo 'alias awsid="aws sts get-caller-identity"' >> ~/.zshrc

# NPM�֘A�̃G�C���A�X
echo 'alias npmfl="npm run format && npm run lint:fix"' >> ~/.bashrc

# CDK�֘A�̃G�C���A�X
echo 'alias cdksynth="npm run cdk synth \"Dev/*\""' >> ~/.bashrc

# ���̑��̃G�C���A�X
echo '
# �v���t�@�C���w��\��AWS SSO���O�C���֐�
awsloginp() {
  if [ -z "$1" ]; then
    echo "�g�p�@: awsloginp <�v���t�@�C����>"
    return 1
  fi
  aws sso login --profile "$1" && echo "���݂̔F�؏�� ($1):" && aws sts get-caller-identity --profile "$1"
}

# �v���t�@�C���w��\��AWS�F�؏��m�F�֐�
awsidp() {
  if [ -z "$1" ]; then
    echo "�g�p�@: awsidp <�v���t�@�C����>"
    return 1
  fi
  aws sts get-caller-identity --profile "$1"
}

# �v���t�@�C���w��\��AWS SSO���O�C���֐�
awsloginp() {
  if [ -z "$1" ]; then
    echo "�g�p�@: awsloginp <�v���t�@�C����>"
    return 1
  fi
  aws sso login --profile "$1" && echo "���݂̔F�؏�� ($1):" && aws sts get-caller-identity --profile "$1"
}

# �v���t�@�C���w��\��AWS�F�؏��m�F�֐�
awsidp() {
  if [ -z "$1" ]; then
    echo "�g�p�@: awsidp <�v���t�@�C����>"
    return 1
  fi
  aws sts get-caller-identity --profile "$1"
}

# �G�C���A�X��Tips��\������֐�
tips() {
  echo "-----------------------------------"
  echo "�֗��ȃR�}���hTips"
  echo "-----------------------------------"
  echo "AWS�֘A�F"
  echo "  �uawslogin�v: AWS SSO���O�C�� + ���݂̔F�؏��m�F�i�f�t�H���g�v���t�@�C���j"
  echo "  �uawsid�v: �F�؏��m�F�̂݁i�f�t�H���g�v���t�@�C���j"
  echo "  �uawsloginp <�v���t�@�C����>�v: �w��v���t�@�C����AWS SSO���O�C�� + �F�؏��m�F"
  echo "  �uawsidp <�v���t�@�C����>�v: �w��v���t�@�C���ŔF�؏��m�F�̂�"
  echo ""
  echo "NPM�֘A�F"
  echo "  �unpmfl�v: linter ����� formatter �̎��s�inpm run format && npm run lint:fix�j"
  echo "CDK�֘A�F"
  echo "  �ucdksynth�v: CloudFormation �e���v���[�g�̐����inpm run cdk synth \"Dev/*\"�j"
  echo ""
  echo "���̑��F"
  echo "  �utips�v: ���̃w���v���b�Z�[�W��\��"
  echo "-----------------------------------"
  echo "��:"
  echo "  awslogin             �F �f�t�H���g�v���t�@�C���Ń��O�C��"
  echo "  awsloginp dev-admin  �F dev�v���t�@�C���Ń��O�C��"
  echo "  npmfl                �F linter ����� formatter �̎��s"
  echo "-----------------------------------"
}
' >> ~/.bashrc

# �ύX�����݂̃V�F���ɔ��f������
#source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null
source ~/.bashrc 2>/dev/null


echo "-----------------------------------"
echo "checking versions..."
echo "-----------------------------------"

echo "node version: $(node -v)"
echo "npm version: $(npm -v)"
echo "aws version: $(aws --version)"
echo "cdk version: $(cdk --version)"
echo "git version: $(git --version)"

echo "uv version: $(uv --version)"
echo "uvx version: $(uvx --version)"

echo "-----------------------------------"
echo "checking aws configuration..."
echo "-----------------------------------"

# "Error when retrieving token from sso: Token has expired and refresh failed" �Ƃ����G���[���o��ꍇ��
# �߂�l������łȂ��Ȃ邽�߁Aecho ""�����Ă���
# �{���́Aaws sso login <profile>�����s���ăg�[�N�����X�V����K�v������
echo "## aws configure list"
aws configure list || echo ""
echo "## aws configure list-profiles"
aws configure list-profiles || echo ""

# �����tips�\��
echo "�o�^�ς݂֗̕��ȃR�}���h�G�C���A�X�́Atips�R�}���h�����s���Ċm�F���Ă�������"
