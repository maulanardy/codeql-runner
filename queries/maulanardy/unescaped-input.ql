/**
 * @name Unescaped user input
 * @description Detects places where user input is not properly escaped for use in a regular expression.
 * @kind problem
 * @problem.severity warning
 */

 import javascript

 from Expr expr, CallExpr call, MethodCallExpr method
 where
   // Find calls to RegExp with user input
   (call.getTarget().getName() = "RegExp" and call.getArgument(0).getKind() = ExprKind.STRING_LITERAL) or
   // Find calls to match, search, or replace with user input
   (method.getName() = "match" or method.getName() = "search" or method.getName() = "replace") and
   method.getArgument(0).getKind() = ExprKind.STRING_LITERAL
 select
   "Unescaped user input in " + expr.getLocation().getFile().toString() + " at line " + toString(expr.getLocation().getStart().getLine()) + ", column " + toString(expr.getLocation().getStart().getColumn())