/**
 * @name Use of MD5 for hashing
 * @description MD5 is an obsolete cryptographic hash algorithm and should be replaced with a stronger alternative.
 * @kind problem
 * @problem.severity warning
 * @security-severity 5.0
 * @precision high
 * @id java/md5-hash-algorithm
 * @tags security
 *       external/cwe/cwe-327
 *       external/cwe/cwe-328
 */

import java

from MethodCall call, CompileTimeConstantExpr algorithm
where
  call.getMethod().hasQualifiedName("java.security", "MessageDigest", "getInstance") and
  algorithm = call.getArgument(0) and
  algorithm.getStringValue().toLowerCase() = "md5"
select call, "MD5 is obsolete and should be replaced with a stronger hash algorithm."
