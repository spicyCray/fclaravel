<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\admin\Models\Client as ClientModel;
class ClientController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Example controller';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ClientModel);

        $grid->column('id', __('ID'))->sortable();
        $grid->column('name', '名称')->sortable();
        $grid->column('image', '图片')->sortable();
        $grid->column('age', '年龄')->sortable();
        $grid->column('sex', '性别')->sortable()->using(['男','女','未设置']);
        $grid->column('content', '个人介绍')->sortable();
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed   $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(ClientModel::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ClientModel);

        $form->display('id', __('ID'));
        $form->text('name','名称');
        $form->image('image', '图片');
        $form->text('age', '年龄');
        $form->select('sex', '性别')->options([0 => '男', 1 => '女', '2' => '未设置']);
        $form->text('content', '个人介绍');
        $form->display('created_at', __('Created At'));
        $form->display('updated_at', __('Updated At'));

        return $form;
    }
}
