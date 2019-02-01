if Rake::Task.task_defined?("assets:precompile")
  Rake::Task['assets:precompile'].enhance do
    Railspack.run Railspack.before_assets_precompile_script
  end
else
  Rake::Task.define_task("assets:precompile") do
    Railspack.run Railspack.before_assets_precompile_script
  end
end
