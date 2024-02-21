/**
 * �t�@�C�����Fmessage.js
 * ���b�Z�[�W����
 *
 * �ύX����
 * 1.0  2010/09/10 Kazuya.Naraki
 */

/**
 * ���b�Z�[�W�̒�`
 */
var messageArr = {
        'E-MSG-000001':'{0}�͕K�{�ł��B',
        'E-MSG-000002':'���O�C��ID�܂��̓p�X���[�h���Ⴂ�܂��B',
        'E-MSG-000003':'{0}�͔��p�J�i���͂ł��B',
        'E-MSG-000004':'{0}�́uhh:mm�v�`���œ��͂��Ă��������B',
        'E-MSG-000005':'�J�n�����I��������̓��t�ƂȂ��Ă��܂��B'
};

/**
 * �G���[���b�Z�[�W��\������B
 * param str �G���[���b�Z�[�W
 * param repStrArr �u��������̔z��
 */
function showMessage(errorCode, repStrArr) {
    var message = messageArr[errorCode];

    // �u�����镶����̔z�񕪏������J��Ԃ�
    for (var i = 0; i < repStrArr.length; i++) {
        var patern = new RegExp("\\{" + i + "\\}", "g");
        message = message.replace(patern, repStrArr[i]);
    }

    message = errorCode + '�F' + message;

    alert(message);
}

/**
 * �G���[���b�Z�[�W���擾����B
 * param str �G���[���b�Z�[�W
 * param repStrArr �u��������̔z��
 * return �G���[���b�Z�[�W
 */
function getMessage(errorCode, repStrArr) {
    var message = messageArr[errorCode];

    // �u�����镶����̔z�񕪏������J��Ԃ�
    for (var i = 0; i < repStrArr.length; i++) {
        var patern = new RegExp("\\{" + i + "\\}", "g");
        message = message.replace(patern, repStrArr[i]);
    }

    message = errorCode + '�F' + message + '\n';

    return message;
}

/**
 * �G���[���b�Z�[�W���擾����B
 * param str �G���[���b�Z�[�W
 * param repStrArr �u��������̔z��
 * return �G���[���b�Z�[�W
 */
function getMessageCodeOnly(errorCode) {
    var message = messageArr[errorCode];

    message = errorCode + '�F' + message + '\n';

    return message;
}

