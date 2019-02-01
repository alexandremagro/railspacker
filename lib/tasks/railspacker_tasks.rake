if Rake::Task.task_defined?("assets:precompile")
  Rake::Task['assets:precompile'].enhance do
    Railspacker.run Railspacker.before_assets_precompile_script
  end
else
  Rake::Task.define_task("assets:precompile") do
    Railspacker.run Railspacker.before_assets_precompile_script
  end
end
