class IssueService {
  static String getMessagesFromFirebaseCode(String errorMessage) {
    switch (errorMessage) {
      case 'email-already-in-use':
        return 'E-mail já está em uso';
      case 'invalid-email':
        return errorMessage = 'E-mail Invalido';
      case 'weak-password':
        return errorMessage = 'Senha Muito Fraca';
      case 'wrong-password':
        return errorMessage = 'Senha Incorreta';
      case 'user-not-found':
        return errorMessage = 'Usuario Não Encontrado';
    }
    return errorMessage;
  }
}
