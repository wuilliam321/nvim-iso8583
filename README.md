# dotfiles

```
stow -S .
```

```
stow -R .
```

select * from vendor;
\d
\d entity;
\d entity_step;
\d entity_step_required_state;
\d entity_step_state;
\d schema_migrations;
\d state;
\d step;
\d user_training;
\d user_training_entity_step;
\d user_training_step;
\d vendor;
\d vendor_step;
\d vendor_step_state;


\d vendor_onboarding;

select
  *
from
  vendor_onboarding
where
  global_entity_id = 'PY_UY'
  and vendor_id = '44688'
  -- and activated_at is not null
order by
  vendor_id asc
;


update
  vendor_onboarding
set
  activated_at = '2022-06-28 08:32:23.350216+00'
where
  global_entity_id = 'PY_UY'
  and vendor_id = '44688'
