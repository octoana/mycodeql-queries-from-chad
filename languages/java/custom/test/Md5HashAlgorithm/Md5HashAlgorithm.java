import java.security.MessageDigest;

public class Md5HashAlgorithm {
  private static final String LEGACY_ALGORITHM = "MD5";

  void badLiteral() throws Exception {
    MessageDigest.getInstance("MD5");
  }

  void badConstant() throws Exception {
    MessageDigest.getInstance(LEGACY_ALGORITHM);
  }

  void good() throws Exception {
    MessageDigest.getInstance("SHA-256");
  }
}
