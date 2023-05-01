/**
 * @name No Effect
 * @kind problem
 * @problem.severity warning
 * @id javascript/example/no-effect
 */

import javascript

from Expr e
where e.isPure() and
  e.getParent() instanceof ExprStmt
select e, "This expression has no effect."