Context context = getActivity(); return activity that is associated with current fragment
SharedPreferences sharedPref = context.getSharedPreferences(
        getString(R.string.preference_file_key), Context.MODE_PRIVATE);

getSharedPreferences(Preferences'name, MODE_PRIVATE) 

— Use this if you need multiple shared preference files identified by name, which you specify with the first parameter. You can call this from any Context in your app.

getPreferences(MODE_PRIVATE) 

— Use this from an Activity if you need to use only one shared preference file for the activity. Because this retrieves a default shared preference file that belongs to the activity, you don't need to supply a name.

View中的setTag(Onbect)表示给View添加一个格外的数据，以后可以用getTag()将这个数据取出来。
可以用在多个Button添加一个监听器，每个Button都设置不同的setTag。这个监听器就通过getTag来分辨是哪个Button 被按下。

android:descendantFocusability=
beforeDescendants：viewgroup会优先其子类控件而获取到焦点
afterDescendants：viewgroup只有当其子类控件不需要获取焦点时才获取焦点
blocksDescendants：viewgroup会覆盖子类控件而直接获得焦点