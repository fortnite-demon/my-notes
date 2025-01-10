terraform {
  copy_terraform_lock_file = true # Нужно ли копировать .terraform.lock.hcl из кеша в рабочую директорию, по умолчанию (true)
  include_in_copy = [".*"]        # Какие файлы нужно добавить в .terragrunt-cache при копировании, например он не копирует скрытые файлы

  extra_arguments "common" {
    commands = get_terraform_commands_that_need_vars() # Список команд которым будут передаваться аргументы

    arguments = [
      "-var-file=${find_in_parent_folders("common.tfvars")}" # Например. Какие аргументы будут передаваться
    ]

    required_var_files/optional_var_files # Списки файлов (.tfvars) которые будут переданы terraform, в optional за исключением несуществующих

    env_vars = {} # Карта пар ключ=значение которые устанавливаются в качестве переменных среды при вызове terraform
  }

  after_hook "hook" { # Какие действия нужно выполнить после commands. Специальные хуки: terragrunt-read-config (загрузка конфига) запускается в terragrunt.hcl директории
                      #                                                                  init-from-module (копирование кода модулей) в terragrunt.hcl
                      #                                                                  init (terraform init) в директории модуля .terragrunt-cache/.../...
    commands = [...]

    execute = [...]

    working_dir = ""
    run_on_error = "" # При ошибке предыдущего хука, выполнять ли слудующий
    suppress_stdout = "" # Вывод команд не выводится на stdout
  }
}
